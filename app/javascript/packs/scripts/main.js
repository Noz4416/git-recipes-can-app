
// // import { ScrollObserver } from './libs/scroll'

window.addEventListener('turbolinks:load', function () {
// 	new Main();
// 	new MobileMenu();
	new addFields();
	new removeFields();

	if (document.URL.match("recipes/new") ||
		document.URL.match("recipes/[0-9]+/edit") ||
		document.URL.match("users/edit") ||
		document.URL.match("^/users$") ||
		document.URL.match("inventories/[0-9]+/edit") ||
		document.URL.match("inventories/new")
	) {
		// new imgPreView();
	}
});


class addFields {
  constructor(){
    this.links = document.querySelectorAll('.js-add_fields');
    this.iterateLinks();
  }

  iterateLinks() {
    if (this.links.length === 0) return;
      this.links.forEach((link) => {
        link.addEventListener('click', (e) => {
        this.handleClick(link, e);
      });
    });
  }

  handleClick(link, e) {
    if (!link || !e) return;
    e.preventDefault();
    let time = new Date().getTime();
    let linkId = link.dataset.id;
    let regexp = linkId ? new RegExp(linkId, 'g') : null;
    let newFields = regexp ? link.dataset.fields.replace(regexp, time) : null;
    newFields ? link.insertAdjacentHTML('beforebegin', newFields) : null ;
  }
}

class removeFields {
  constructor() {
    this.iterateLinks();
  }

  iterateLinks() {
    document.addEventListener('click', e => {
      if (e.target && e.target.className == 'js-remove_fields') {
        this.handleClick(e.target, e);
      }
    });
  }

  handleClick(link, e) {
    if (!link || !e) return;
    e.preventDefault();
    let fieldParent = link.closest('.nested-fields');
    let deleteField = fieldParent
      ? fieldParent.querySelector('input[type="hidden"]')
      : null;
    if (deleteField) {
      deleteField.value = 1;
      fieldParent.style.display = 'none';
    }
  }
}

