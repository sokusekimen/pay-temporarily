'use strict';

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

// import '../javascripts/';
import '../stylesheets/application';
require.context('../images', true, /\.(png|jpg|jpeg|svg)$/);

window.onload = () => {
  const getSelectMember = document.getElementById('selectmember');
  
  if(getSelectMember){
    const childElementCount = getSelectMember.childElementCount;
    if(childElementCount >4){
      getSelectMember.classList.add('scrollbar');
    }
  }
}