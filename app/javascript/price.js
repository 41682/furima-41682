function price (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    // 入力された価格を取得
    const priceInput = itemPrice.value;
    // 数値以外の文字が含まれていないかチェック
    if (/^\d+$/.test(priceInput)) {
      // 数値以外の文字が含まれていなければ、数値に変換
      const priceValue = parseInt(itemPrice.value);

      // 数値が300以上かつ9,999,999以内であれば計算を行う
      if (priceValue >= 300 && priceValue <= 9999999) {
        // 価格に10%の手数料を加算 (小数点以下を削除)
        const itemPriceAddTax = Math.floor(priceValue * 0.1);  // 小数点以下を切り捨て
        const subtractionResult = Math.floor(priceValue - itemPriceAddTax);  // 小数点以下を切り捨て
        // 画面に表示
        const addTaxPrice = document.getElementById("add-tax-price");
        addTaxPrice.innerHTML = `${itemPriceAddTax}`;
        const profit = document.getElementById("profit");
        profit.innerHTML = `${subtractionResult}`;
      } else {
        // 範囲外の値はゼロにする
        const addTaxPrice = document.getElementById("add-tax-price");
        addTaxPrice.innerHTML = "";
        const profit = document.getElementById("profit");
        profit.innerHTML = "";
      }

    } else {
      // 数値以外が含まれている場合はゼロにする
      const addTaxPrice = document.getElementById("add-tax-price");
      addTaxPrice.innerHTML = "";
      const profit = document.getElementById("profit");
      profit.innerHTML = "";
    }
  });
};

window.addEventListener('turbo:load', price);