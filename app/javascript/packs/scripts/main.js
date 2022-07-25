
class addFields {
  constructor(){
    this.links = document.querySelectorAll('.add_fields');
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

window.addEventListener('turbolinks:load',() => new addFields());


class removeFields {
  constructor(){
    this.iterateLinks();
  }

  iterateLinks() {
		document.addEventListener('click', e => {
			if (e.target && e.target.className == 'remove_fields') {
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

window.addEventListener('turbolinks:load',() => new removeFields());

