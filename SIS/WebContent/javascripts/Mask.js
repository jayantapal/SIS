if (typeof(CTVA) == 'undefined') { CTVA = {}; }; if (typeof(CTVA.pesUtil) == 'undefined') { CTVA.pesUtil = {}; };

(function(){
    var Dom = YAHOO.util.Dom;
    var Event = YAHOO.util.Event;
	
/**
 * Covers an element with a mask.
 *
 * @class Mask
 * @namespace CTVA.pesUtil
 * @constructor
 * @param elem {HTMLElement} The element that the mask will cover. (optional, will default to document.body)
 */
CTVA.pesUtil.Mask = function(cDocument) {
    this.elem = cDocument.body; //elem || 
    this.cDocument = cDocument;
    this.render();
};

CTVA.pesUtil.Mask.prototype = {
    
    /**
     * Destroys the mask element and remove event listeners.
     *
     * @method destroy
     */
    destroy : function() {
        this.hide();
        this.cDocument.body.removeChild(this.mask);
       // Event.removeListener(window, 'resize', this.setPosition);
    },
    
    /**
     * Hides the mask.
     *
     * @method hide
     */
    hide : function() {
        this.mask.style.display = 'none';
        Dom.removeClass(this.cDocument.body, this.CLASS_BODY_MASKED);
    },
    
    /**
     * Resizes and positions the mask.
     *
     * @method setPosition
     * @private
     */
    setPosition : function() {
        this.setHeight();
        this.setWidth();
        this.setX();
        this.setY();
    },
    
    /**
     * Creates the mask element and sets up a listener for window resizing.
     *
     * @method render
     * @private
     */
    render : function() {
            if(this.hasMasked())
            	return;
            
		    this.mask = this.cDocument.createElement('div');
		    this.mask.setAttribute("id", "sysMonitor")
		   // this.mask.onclick=function(){if(top!= null && top.popupWindow!= null && !top.popupWindow.closed){alert(top.g_focusMessage);top.popupWindow.focus();}else{alert(top.g_unlockMessage);top.closeMask();}};
		   this.mask.onclick=function(){if(top!= null && top.popupWindow!= null && !top.popupWindow.closed){top.popupWindow.focus();}else{top.closeMask();}};
		    Dom.addClass(this.mask, this.CLASS_MASK);
		    this.mask.innerHTML = "&#160;";
		    this.cDocument.body.insertBefore(this.mask, this.cDocument.body.firstChild);
		    
		    this.setPosition();
		    
		    this.show();
      //  Event.on(window, 'resize', this.setPosition, this, true);
    },
    
    /**
     * Sets the height of the mask element based on the element it is covering.
     *
     * @method setHeight
     * @return {String}
     */
    setHeight : function() {
        if (this.elem.tagName.toLowerCase() == 'body') {
            this.mask.style.height = Dom.getDocumentHeight() + 'px';
        }
        else {
            this.mask.style.height = this.elem.offsetHeight + 'px';
        }
    },
    
    /**
     * Sets the width of the mask element based on the element it is covering.
     *
     * @method setWidth
     * @return {String}
     */
    setWidth : function() {
        if (this.elem.tagName.toLowerCase() == 'body') {
            this.mask.style.width = Dom.getViewportWidth() + 'px';
        }
        else {
            this.mask.style.width = this.elem.offsetWidth + 'px';
        }
    },
    
    /**
     * Sets the X position of the mask element based on the position of the element it is covering.
     *
     * @method setX
     * @return {String}
     */
    setX : function() {
        this.mask.style.left = ( this.elem == document.body ? '0px' : Dom.getX(this.elem) + 'px' );
    },
    
    /**
     * Sets the Y position of the mask element based on the position of the element it is covering.
     *
     * @method setY
     * @return {String}
     */
    setY : function() {
        this.mask.style.top = ( this.elem == document.body ? '0px' : Dom.getY(this.elem) + 'px' );
    },
    
    /**
     * Shows the mask.
     *
     * @method show
     */
    show : function() {
        this.mask.style.display = 'block';
        Dom.addClass(this.cDocument.body, this.CLASS_BODY_MASKED);
    },
    
   /**
    * check whether the mask is already exists or not.
    *
    * @method hasMasked
    * @return {boolean}
    */
    hasMasked : function() {
    	return this.cDocument.getElementById("sysMonitor")==null?false:true;
    
    },
    
    CLASS_MASK : 'mask',
    CLASS_BODY_MASKED : 'masked'
};
})();
