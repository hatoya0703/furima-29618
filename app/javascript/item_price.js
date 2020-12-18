function autoCalc() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input',() => {
    // 入力した価格の値を取得
    const inputValue = priceInput.value;
    // 販売手数料の要素を取得
    const addTaxDom = document.getElementById("add-tax-price");
    // 販売手数料のHTML要素を、入力した値の1/10を「文字列として」書き換え
    addTaxDom.innerHTML = Math.floor(inputValue/10);
    // 演算を行うため、書き換えた文字列を数値に変換
    const addTaxDomValue = Number(addTaxDom.textContent);
    // 販売利益の要素を取得
    const addProfitDom = document.getElementById("profit");
    // 販売手数料のHTML要素を、「価格 - 販売手数料」の値に、文字列として書き換え
    addProfitDom.innerHTML = inputValue - addTaxDomValue;
  });
}
window.addEventListener('load',autoCalc)