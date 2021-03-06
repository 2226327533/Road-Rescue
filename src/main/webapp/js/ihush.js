(function($){

	// string
	$.string = {
		striptags : function (s) {
			return s.replace(/<[^>].*?>/g,"");
		}
	}
	
	// popup box
	$.overlay = {
		show : function () {
			$('div.main').block({
				css : { padding : '20px'},
				message : '<h1><img src="../img/busy.gif" /> &nbsp; Processing ...</h1>'
			});
		},
		frame : function (url, callback) {
			$.blockUI.defaults.topOffset = '100';
			$('div.main').block({
				css : { padding : '0px', width : '50%'},
				message : '<iframe id="overlayInnerIframe" style="width:100%;height:500px;border:none;overflow-x:hidden" src="' + url + '"></iframe>',
				onBlock : function () {
					$('iframe#overlayInnerIframe').load(callback)
				}
			});
		},
		msg : function (msg) {
			$('div.blockMsg').html(msg);
		},
		close: function (sec) {
			timeout = sec || 0;
			setTimeout(function(){
				$('div.main').unblock();
			}, timeout);
			
		}
	}
	
	// form funcs
	$.form = {
		select: function (selector) {
			var select_ele = $(selector);
			select_ele.focus(function(){
				$(this).select();
			});
		},
		jumpto: function (url, msg) {
			location.href = encodeURI(url)
		},
		confirm: function (url, msg) {
			if (confirm(msg)) {
				location.href = encodeURI(url);
			}
		},
		addtext: function (tid, str) {
			var textArea = document.getElementById(tid);
			var textLength = textArea.value.length;
			textArea.focus();
			if(typeof document.selection != "undefined") {
				document.selection.createRange().text = str;
				document.selection.createRange().select();
			} else {
				var startPos = textArea.selectionStart;
				var endPos = startPos + str.length;
				textArea.value = textArea.value.substr(0, textArea.selectionStart) + str + textArea.value.substring(textArea.selectionEnd, textLength);
				textArea.setSelectionRange(startPos, endPos); 
			}
		},
		filter: function (options) {
			var filter_input = options.filter_input;
			var filter_rows = options.filter_rows;
			var filter_val = options.filter_val;
			$(filter_input).keyup(function(){
				input = $(this).val();
				if (input == '') {
					$(filter_rows).show();
				} else {
					$(filter_rows).hide();
					filter_val.each(function(){
						var text = $.string.striptags($(this).html());
						var regexp = new RegExp("^" + input);
						if (regexp.test(text)) {
							$(this).parents("tr").show();
						}
					});
				}
			});
		}
	}
	
	// toggle exts
	$.toggle = {
		input: function (selector) {
			var toggle_ele = $(selector);
			var str_old = toggle_ele.val();
			var str_new = "";
			toggle_ele.focus(function(){
				str_new = $(this).val();
				if (str_new == str_old || str_new == '') {
					str_new = $(this).val();
					$(this).val('');
				}
			}).blur(function(){
				if ($(this).val() == '') {
					$(this).val(str_old);
				}
			});
		},
		textarea: function (selector) {
			var toggle_ele = $(selector);
			var str_old = toggle_ele.get(0).value;
			var str_new = "";
			toggle_ele.focus(function(){
				str_new = $(this).get(0).value;
				if (str_new == str_old || str_new == '') {
					str_new = $(this).get(0).value;
					$(this).get(0).value = '';
				}
			}).blur(function(){
				if ($(this).get(0).value == '') {
					$(this).get(0).value = str_old;
				}
			});
		}
	}
	
})(jQuery);

$(document).ready(function(){
	
	// tlist table styles
	$('.tlist').find("tbody tr").mouseover(function(){
		if(!$(this).hasClass("click")){
			$(this).css({'background':'#D9E8F5'});
		}
	}).mouseout(function(){
		if(!$(this).hasClass("click")){
			$(this).css({'background':'#FFFFFF'});
		}
	});
	
	
	$('.tlist').find('tbody tr').click(function(){
		$('.tlist').find('tbody tr').css({'background':'#FFFFFF'}).removeClass("click");
		$(this).css({'background':'#EFFDCD'}).addClass("click");
	});
	
	/**删除确认**/
	$(".option .del").click(function(event){
		if(!confirm("确定要删除这条记录？")){
			event.preventDefault();
		}	
	});
	
	/**全选复选框单击事件**/
	$("#chkall").click(function() {
		$(".itemid").prop("checked", this.checked);
		
	});
	
});