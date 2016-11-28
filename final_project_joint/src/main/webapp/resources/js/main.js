var lastbno_save = null;
$(document).ready(function () {
   $(window).bind("scroll",scrolling);
   $('form').bind("keypress", function(e) {
	   if (e.keyCode == 13) {               
	     e.preventDefault();
	     return false;
	   }
	 });
});

function scrolling(){ 
	var documentHeight  = $(document).height() * 2 - 1200;
	var scrollHeight = $(window).scrollTop()+$(window).height();
	
	if(scrollHeight >= documentHeight) {
		var lastbno = $(".thumbnail:last").attr("data-bno");	
		if(lastbno_save != lastbno){  
		lastbno_save = lastbno;
		$.ajax({ // 스크롤링 
			
			type:"get",
			url:"scroll",
			dataType:"json",
			data:{"last_bno":lastbno},
			beforeSend:function(){
				loadingbar='	<div class="loader loader--style8" title="7">'
				loadingbar+='<svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"'+
				'width="24px" height="30px" viewBox="0 0 24 30" style="enable-background:new 0 0 50 50;" xml:space="preserve">'+
				'<rect x="0" y="10" width="4" height="10" fill="#333" opacity="0.2">'+
				'<animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0s" dur="0.6s" repeatCount="indefinite" />'+
				'<animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0s" dur="0.6s" repeatCount="indefinite" />'+
				'<animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0s" dur="0.6s" repeatCount="indefinite" />'+
				'</rect>'+
				'<rect x="8" y="10" width="4" height="10" fill="#333"  opacity="0.2">'+
				'<animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0.15s" dur="0.6s" repeatCount="indefinite" />'+
				'<animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0.15s" dur="0.6s" repeatCount="indefinite" />'+
				'<animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0.15s" dur="0.6s" repeatCount="indefinite" />'+
				'</rect>'+
				'<rect x="16" y="10" width="4" height="10" fill="#333"  opacity="0.2">'+
			    '<animate attributeName="opacity" attributeType="XML" values="0.2; 1; .2" begin="0.3s" dur="0.6s" repeatCount="indefinite" />'+
				'<animate attributeName="height" attributeType="XML" values="10; 20; 10" begin="0.3s" dur="0.6s" repeatCount="indefinite" />'+
				'<animate attributeName="y" attributeType="XML" values="10; 5; 10" begin="0.3s" dur="0.6s" repeatCount="indefinite" />'+
				'</rect>'+
				'</svg>'+
				'</div>'
				$("#loading").html(loadingbar);
				
			},
			success:function(scrollData){
				/* console.log("실행중") */
				var str = "";
				var list = scrollData.datas;
				$(list).each(function(index,objArr){
					
					str += '<div class="row">';
			        str += '<div class="col-md-12">';
			        str += '	<div class="thumbnail" data-bno='+this.b_no+' >';
			        str += '			<form action="friendinfo" id="friend'+objArr["b_no"]+'" method="post">';
					str += '				<input type="hidden" name="m_no" value="'+objArr["b_mno"]+'">';
					str += '         		<h4>&nbsp;&nbsp;<a href="javascript:;"  onclick="gofriend('+objArr["b_no"]+')">'+objArr["b_mname"]+'</a></h4></form>';
			       	str += '<div class="thumbnail-wrapper1">' +
							'<div class="thumbnail1" style="background-color: #000;">' +
							'<div class="centered1">';
			        str += '       <img src='+objArr["b_image"]+' class="landscape1">' +
			        		'</div></div></div>';
			        
			        str += '       <div class="caption">';
			        str += '       <div class="row">';
			        str += '          <div class="col-md-12">';
			        
			        str += '          <p>'+objArr["b_content"]+'</p>';
			        str += '          <br></div>';
			        str += '       </div>';
			        //라이크
			        var should_split = this.like_mname;
			        var like_view = "";
			        var n = should_split.split(',');
			        //console.log("자를 문자열 길이 : " + should_split.length);
			        //console.log("이름 숫자 길이 :" + n.length);
			        if (n == 0) {
						like_view = "처음 좋아요의 주인공이 되세요";
					}else if (n > 11){
						like_view = n.length + "명 이상 좋아합니다"
					}else{
						for (var i = 0; i < n.length; i++) {
							like_view += n[i] + "&nbsp;&nbsp; ";
						}
						like_view += '님이 좋아합니다';
					}
			        
			        str += '<div class="row">';
			        str += '	<div class="col-md-12">';
			        str += '		&nbsp;<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp;';
			        str += '		<span id="showlike'+this.b_no+'">';
			        str += ''+like_view+'';
			        str += '		</span>';
			        str += '	</div>';
			        str += '</div>';
					//댓글
					var reply_Mno = this.reply_Mno;
					var reply_Name = this.reply_Name;
					var reply_Content = this.reply_Content;
					var reply_Count = this.reply_Count;
					var reply_name_view = reply_Name.split(',');
					var reply_content_view = reply_Content.split(',');
                    var reply_Mno_view = reply_Mno.split(',');
			        str += '<div class="row">';
					str += '	<div class="col-md-12">';
					str += '		<div id="showreply'+this.b_no+'">';
					str += '			<table class="table-condensed small" style="background-color: rgb(245, 245, 245); width: 100%">';
					if (reply_Count > 5) {
					str += '				<tr>';
					str += '					<td><a href="javascript:;" onclick="showReplyMore('+this.b_no+')">show reply all</a></td>';
					str += '				</tr>';
					}else if(reply_Count == 0){
					str += '				<tr>';
					str += '					<td>아직 작성된 댓글이 없습니다.</td>';
					str += '				</tr>';	
					}
					
					if(reply_Count > 0){						
						for (var i in reply_name_view) {
							str += '				<tr>';
	                        str += '<td><a href="friendinfo?m_no=' + reply_Mno_view[i] + '">'+ reply_name_view[i]+'</a> '+reply_content_view[i]+'</td>';
							str += '				</tr>';
						}
					}
					str += '			</table>';
					str += '		</div>';
					str += '	</div>';
					str += '</div>';
			        //like Yn
			        str += '<div class="row top_pd">';
					str += '	<form action="insertReply" method="post" id="reply'+this.b_no+'"';
					str += '			name="reply">';
					str += '		<div class="col-md-12">';
					str += '			<div class="input-group">';
					str += '				<span class="input-group-addon " id="sizing-addon2">';
					var likeYnCheck = this.likeYnCheck;
					if (likeYnCheck >= 1) {
						str += '<span class="glyphicon glyphicon-heart" onclick="likecancel('+this.b_no+')" style="color: red" id="likeYN'+this.b_no+'"></span>';
					}else {
						str += '<span class="glyphicon glyphicon-heart" onclick="likesubmit('+this.b_no+')" id="likeYN'+this.b_no+'"></span>';
					}
					str += '				</span> <input type="text" class="form-control"';
					str += '				placeholder="답글달기..." aria-describedby="sizing-addon2"';
                    str += '                name="r_content" id="r_content'+this.b_no+'"  onkeydown="javascript:if(event.keyCode==13){replySubmit('+this.b_no+')}"> <input';
					str += '				type="hidden" name="r_bno" value="'+this.b_no+'"> <input';
//					str += '				type="hidden" name="r_mno" value="'+ ${mno} +'">'; 
					str += '				type="hidden" name="r_mno" value="' + ${mno} +'">'; 

//												<!-- 답글 버튼 --> 
					str += '				<span class="input-group-btn">';
					str += '				<button class="btn btn-default" type="button"';
					str += '				id="btn_reply" onclick="replySubmit('+this.b_no+')">답글</button>';
					str += '			</span>'; 
				//								<!-- 답글 버튼 끝 -->  
					str += '		</div>';
					str += '	</div>';
							//
					str += '	</form>';
					str += '</div>';
			        //
			        str += '</div>';
					str += '</div>';
					str += '</div>';
					str += '</div>';
				});
				$("#scrollingId").append(str)
				
			},
			error:function(){
				console.log("scroll 이벤트 실패")
			}
		});	

      }
   }
}
function anniAjax(){
	alert("dd");
}

   function replySubmit(no){

      if($( "#r_content"+no ).val() == ""){
         alert("댓글에 내용을 써주세요");
         return;
      }else{
      
      
      $.ajax({
         type:"post",
         url:"insertReply",
         data:$("#reply"+no).serialize(),
         dataType:'json',
         success:function(replyData){
            var str = "<table class='table-condensed small' style='background-color: rgb(245, 245, 245); width: 100%'>"
            var list = replyData.datas;
            var count = replyData.count;
            if(count>5){
               str += '<tr><td> <a href="javascript:;" onclick= "showReplyMore('+no+')">show reply all</a></td></tr>'
            }
               jQuery(list).each(function(index, objArr){
               str += "<tr>";
               str += "<td><a href='#'>" + objArr.r_name +"</a>&nbsp;"+ objArr.r_content + "</td>";
               str += "</tr>";
            })
            str += "</table>";
            jQuery("#showreply"+no).html(str);
            jQuery("#r_content"+no).val("");
         }
      
      });
      }
   }
      

   function likesubmit(b_no){
         jQuery.ajax({
         type:"post",
         url:"insertLike",
         data:{"l_bno":b_no, "l_mno":"${mno}"},
         dataType:'json',
         success:function(likeData){
            var list = likeData.datas;
            var count = likeData.likecount
            str = "";
            if(count >11){
                    str += count + "명이 좋아합니다";
                   }
               else if(count<=11){
                  jQuery(list).each(function(index, objArr){
                      str += objArr.l_name + "&nbsp&nbsp";
                     }) 
                     str += "님이 좋아합니다";
                   }
            jQuery("#showlike"+b_no).html(str);
            jQuery("#likeYN"+b_no).attr({style:'color: red'});
            jQuery("#likeYN"+b_no).attr({onclick:'likecancel('+b_no+')'})
      }
    })
   }
   function likecancel(b_no){
         jQuery.ajax({
         type:"post",
         url:"cancelLike",
         data:{"l_bno":b_no, "l_mno":"${mno}"},
         dataType:'json',
         success:function(likeData){
            var list = likeData.datas;
            var count = likeData.likecount
            str = "";
            if(count == 0){
               str +="처음 좋아요의 주인공이 되세요";
            }else if(count >11){
                    str += count + "명이 좋아합니다";
                   }
               else if(count<=11){
                  jQuery(list).each(function(index, objArr){
                      str += objArr.l_name + " ";
                     })
                     str += "님이 좋아합니다";
                   }
            jQuery("#showlike"+b_no).html(str);
            jQuery("#likeYN"+b_no).removeAttr("style");
            jQuery("#likeYN"+b_no).attr({onclick:'likesubmit('+b_no+')'})
         }
      });
   }
    function showReplyMore(b_no){
    	$.ajax({
    		type:"post",
    		url:"moreReply",
    		data:{"b_no":b_no},
    		dataType:'json',
    		success:function(replyData){
    			var str = "<table class='table-condensed small' style='background-color: rgb(245, 245, 245); width: 100%'>"
    			var list = replyData.datas;
    			jQuery(list).each(function(index, objArr){
    				str += "<tr>";
                    str += "<td><a href='friendinfo?m_no=" + objArr.r_mno + "'>" + objArr.r_name +"</a>&nbsp;"+ objArr.r_content + "</td>";
    				str += "</tr>";
    			})
    			str += "</table>";
    			jQuery("#showreply"+b_no).html(str);
    			jQuery("#r_content"+b_no).val("");
    		}
    	});
    }	

    function gofriend(b_no){
       jQuery("#friend"+b_no).submit();             
    }