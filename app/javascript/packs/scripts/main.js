/*global $*/
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
    $('#recipe_material_count').val($('section.ingredient > .nested-fields:not(.deletedElement)').length);
    $('.steps-wrapper > .nested-fields:not(.deletedElement) p.step_number').each(function(index){
      $(this).text(index +1);
    });

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
      link.parentElement.parentElement.parentElement.classList.add('deletedElement');
    }
    $('#recipe_material_count').val($('section.ingredient > .nested-fields:not(.deletedElement)').length);
    $('.steps-wrapper > .nested-fields:not(.deletedElement) p.step_number').each(function(index){
      $(this).text(index +1);
    });
  }
}

window.addEventListener('turbolinks:load',() => new removeFields());


// プレビュー機能
window.addEventListener('turbolinks:load', () => {
  const preview = document.querySelector('.preview');
  if (!preview) return;
  preview.addEventListener('change', (e) => {
    const file = preview.files[0];
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => {
      const image = reader.result;
      document.querySelector('.uploader').setAttribute('src', image);
    };
  });
});

document.addEventListener("turbolinks:load", function() {
  $(function () {
    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover();
    $('.popover-dismiss').popover({
      trigger: 'focus'
    });
  });
});

