
function calculation (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('keyup', function(){
    const value = itemPrice.value;

    const taxPrice  = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    taxPrice.innerHTML = `${ Math.floor(value * 0.1).toLocaleString()}`;
    profit.innerHTML = `${ Math.floor(value * (1 - 0.1)).toLocaleString()}`;
  });
};

window.addEventListener('turbo:load', calculation);
window.addEventListener('turbo:render', calculation);
