console.log("Hello world"); // この行が読み込まれた時点で実行される
// 登録ボタンのDOMを取得

function submitFormWitnButton() {
  if (document.getElementById("new_post") != null) {
    const btn = document.getElementById("new_post");
    function submitForm() {
      console.log("Hello world");
      document.forms.new_wish.submit();
    }
    btn.addEventListener("click", submitForm);
  } else if (document.getElementById("edit_post") != null) {
    const btn = document.getElementById("edit_post");
    function submitForm() {
      document.forms.edit_wish.submit();
    }
    btn.addEventListener("click", submitForm);
  }

  // 関数内で定義された関数は、関数の中でしか呼び出せないという性質があるだけで、
  // 通常の関数同様に呼び出せる

  let done_btns = document.querySelectorAll(".small-btn");
  // 達成ボタン情報取得
  done_btns.forEach(function (done_btn) {
    done_btn.addEventListener("click", function () {
      if (this.classList.contains("small-btn__done") == true) {
        this.classList.remove("small-btn__done");
      } else {
        this.classList.add("small-btn__done");
      }
    });
  });
}
window.addEventListener("load", submitFormWitnButton);
