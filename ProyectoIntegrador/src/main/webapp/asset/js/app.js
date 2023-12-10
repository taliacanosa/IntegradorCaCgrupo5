const nombreInput = document.getElementById('nombre');
const apellidoInput = document.getElementById('apellido');
const correoInput = document.getElementById('correo');
const cantidadInput = document.getElementById('cantidad');
const categoriaSelect = document.getElementById('categoria');
const totalInput = document.getElementById('total');
const resumenButton = document.getElementById('resumen');
const borrarButton = document.getElementById('borrar');



resumenButton.addEventListener('click', () => {
   
    const cantidad = parseInt(cantidadInput.value);
    const categoria = categoriaSelect.value;

    
    const precios = {
        Estudiante: 200 * 0.2,
        Trainee: 200 * 0.5,
        Junior: 200 * 0.75,
    };

    
    const precioFinal = cantidad * precios[categoria];

    
    totalInput.value = `$${precioFinal.toFixed(2)}`;
});

borrarButton.addEventListener('click', () => {
  
    nombreInput.value = '';
    apellidoInput.value = '';
    correoInput.value = '';
    cantidadInput.value = '';
    categoriaSelect.selectedIndex = 0;
    totalInput.value = '';
});