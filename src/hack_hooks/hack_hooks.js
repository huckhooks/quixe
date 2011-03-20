if(!window.console) {
    window.console = {
        log: function(s){}//nop
    };
}
HackHooks = function() {
    return {
    	//"exported" from modules
        main_winid: -1,
        windowdic: null,
        image: null,
		
        //own vars
        log: [],
        next_log: [],
        hash: null,
		
        send_response: null,
		
        started: function(image) {
    		console.log("started " + this.main_winid);
            this.image = image;
            this.hash = location.hash;
            var me = this;
            window.onhashchange = function() {
            	me.hash_change();
            };
            console.log("replay");
            this.do_skein();
        },
        notify_new_win: function(winid) {
            if(this.main_winid == -1)
                this.main_winid = winid;
        },
        gotLine: function(res) {
            console.log(JSON.stringify(res));
            //{"type":"line","gen":1,"window":889,"value":"help"}
            this.log.push(res["value"]);
            var json = JSON.stringify({
                log: this.log
            });
            console.log(json);
            //the space is important. some browsers unescape spaces on lookup, some not.
            //the space allows a check location.hash[1] === "%"
            var hash = "# " + json;
            location.hash = hash;
            this.hash = location.hash;
            console.log("done");
        },
        load: function(){
            console.log("load");
            this.do_skein();
            return false;
        },
        do_skein: function() {
        	var json = location.hash.substring(1);
            console.log(json);
            if (json[0] === "%") json = unescape(json);
            this.next_log = [];
            try{
                json = JSON.parse(json);
                this.next_log = json["log"];
            } catch (e) {
            //shrug, defaults
            }
            this.log = [];
            console.log(this.next_log);
            var win = this.windowdic.get(this.main_winid);
            for(var i=0; i < this.next_log.length;i++){
                this.send_response("line",win,this.next_log[i],null);
            }
        },
        hash_change: function() {
        	var changed = this.hash !== location.hash;
        	console.log("hashchange " + changed);
        	if(changed) {
        		console.log("old: " + this.hash);
        		console.log("new: " + location.hash);
        		if(true || confirm("url-skein has changed, reload?"))
        			window.location.reload();
        	}
        	return true;
        },
        //XXX
        transform_output: function(el, val){
        	var url;
            if(url = /^(.*?.). Url: (.*)$/.exec(val)) {
            	if (! /.*:.*/.exec(url[2]) ) url[2] = "../Browsies/" + url[2];
                var ael = new Element('a', {'href': url[2], 'target': '_blank', 'title': 'opens in new window/tab'} ).update(url[1] + ".");
                el.appendChild(ael);
                return true;
           } else if (url = /^(.*?.). Browse: (.*)/.exec(val)){            	
           	if (! /.*:.*/.exec(url[2]) ) url[2] = "../Browsies/" + url[2];
        	   var ael = new Element('a', {'href': url[2], 'target': '_blank', 'title': 'opens in new window/tab'} ).update(url[1] + ": " + url[2]);
        	   el.appendChild(ael);
        	   var bel = new Element('br', {} );
        	   el.appendChild(bel);
        	   var fel = new Element('iframe', {'src': url[2], 'style': 'width: 100%; height: 300px'} );
        	   el.appendChild(fel);
        	   return true;
           } else if (url = /^(.*?.). Image: (.*)/.exec(val)){            	
           	if (! /.*:.*/.exec(url[2]) ) url[2] = "../Browsies/" + url[2];
        	   var ael = new Element('a', {'href': url[2], 'target': '_blank', 'title': 'opens in new window/tab'} ).update(url[1] + ": " + url[2]);
        	   el.appendChild(ael);
        	   var bel = new Element('br', {} );
        	   el.appendChild(bel);
        	   var fel = new Element('img', {'src': url[2]} );
        	   el.appendChild(fel);
        	   return true;
           }
        return false;
    }
};
}();