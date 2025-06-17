// Máscara de telefone para inputs com data-mask="phone"
function mascaraPhone() {
  function formatPhone(value) {
    value = value.replace(/\D/g, '').slice(0, 11);
    if (value.length <= 2) {
      return value;
    } else if (value.length <= 6) {
      return '(' + value.slice(0, 2) + ') ' + value.slice(2);
    } else if (value.length <= 10) {
      return '(' + value.slice(0, 2) + ') ' + value.slice(2, 6) + '-' + value.slice(6);
    } else {
      return '(' + value.slice(0, 2) + ') ' + value.slice(2, 7) + '-' + value.slice(7);
    }
  }
  document.querySelectorAll('input[data-mask="phone"]').forEach(function(input) {
    input.value = formatPhone(input.value);
    input.addEventListener('input', function(e) {
      let value = formatPhone(e.target.value);
      e.target.value = value.slice(0, 15);
    });
    input.addEventListener('blur', function(e) {
      const value = e.target.value.replace(/\D/g, '');
      if (value.length < 10 || value.length > 11) {
        e.target.setCustomValidity('Telefone deve conter entre 10 e 11 dígitos');
      } else {
        e.target.setCustomValidity('');
      }
    });
    input.addEventListener('paste', function(e) {
      e.preventDefault();
      const pastedText = (e.clipboardData || window.clipboardData).getData('text');
      const formattedValue = formatPhone(pastedText).slice(0, 15);
      e.target.value = formattedValue;
    });
  });
}
document.addEventListener('DOMContentLoaded', mascaraPhone);
document.addEventListener('turbo:load', mascaraPhone); 