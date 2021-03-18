window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  console.log(priceInput);
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue / 10)

    const profitDom = document.getElementById("profit");
    profitDom.innerHTML = Math.floor(inputValue * 0.9)
    console.log(profit);
  }) 
});

