// Máscara de CPF para inputs com data-mask="cpf"
document.addEventListener('DOMContentLoaded', function() {
  function formatCPF(value) {
    value = value.replace(/\D/g, '').slice(0, 11);
    if (value.length <= 3) {
      return value;
    } else if (value.length <= 6) {
      return value.slice(0, 3) + '.' + value.slice(3);
    } else if (value.length <= 9) {
      return value.slice(0, 3) + '.' + value.slice(3, 6) + '.' + value.slice(6);
    } else {
      return value.slice(0, 3) + '.' + value.slice(3, 6) + '.' + value.slice(6, 9) + '-' + value.slice(9);
    }
  }
  document.querySelectorAll('input[data-mask="cpf"]').forEach(function(input) {
    input.value = formatCPF(input.value);
    input.addEventListener('input', function(e) {
      let value = formatCPF(e.target.value);
      e.target.value = value.slice(0, 14);
    });
    input.addEventListener('blur', function(e) {
      const value = e.target.value.replace(/\D/g, '');
      if (value.length !== 11) {
        e.target.setCustomValidity('CPF deve conter 11 dígitos');
      } else {
        e.target.setCustomValidity('');
      }
    });
    input.addEventListener('paste', function(e) {
      e.preventDefault();
      const pastedText = (e.clipboardData || window.clipboardData).getData('text');
      const formattedValue = formatCPF(pastedText).slice(0, 14);
      e.target.value = formattedValue;
    });
  });
}); 