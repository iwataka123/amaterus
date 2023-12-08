window.addEventListener('turbo:load', function(){
  const articles = document.querySelectorAll(".article");   //querySelectorAll(".article")でarticleの要素をすべて取得
  articles.forEach(function(article) {    //forEach(function(article)でarticlesの変数から要素を１つ１つ取り出し、articleという名前で扱えるようにする。
    article.addEventListener('mouseover', function() {
      this.setAttribute("style", "box-shadow: 0 10px 25px 0 rgba(0, 0, 0, 0.5);");
    });
    article.addEventListener('mouseout', function() {
      this.removeAttribute("style", "box-shadow: 0 10px 25px 0 rgba(0, 0, 0, 0.5);");
    });
  });
});