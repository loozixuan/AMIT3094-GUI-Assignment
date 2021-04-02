/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
  $("#productInCart").hover(function(){
      $(this).removeClass("overflow-hidden");
      $(this).addClass("overflow-auto");
  },function(){
    $(this).removeClass("overflow-auto");
    $(this).addClass("overflow-hidden");
  });
});


