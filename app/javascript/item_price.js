function count(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDOM = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxDOM.innerHTML = `${Math.floor(inputValue * 10 / 100)}`;
    profit.innerHTML = `${Math.floor(inputValue - inputValue * 10 / 100 )}`;
  })
}

window.addEventListener("load", count)