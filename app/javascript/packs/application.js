'use strict';

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

// import '../javascripts/';
import '../stylesheets/application';
require.context('../images', true, /\.(png|jpg|jpeg|svg)$/);

window.onload = () => {
  const getSelectMember = document.getElementById('selectmember');
  if (getSelectMember) {
    const childElementCount = getSelectMember.childElementCount;
    if (childElementCount > 4) {
      getSelectMember.classList.add('scrollbar');
    }
  }

  const getGroupOwner = document.getElementById('group_owner');
  if (getGroupOwner) {
    const getOwnerId = getGroupOwner.value;
    const getCurrentLabel = document.querySelector(`label[for="group_user_ids_${getOwnerId}"]`);
    getCurrentLabel.hidden = true;
  }
}