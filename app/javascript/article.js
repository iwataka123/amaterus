window.addEventListener('turbo:load', function(){
  const articles = document.querySelectorAll(".article");
  articles.forEach(function(article) {
    article.addEventListener('mouseover', function() {
      this.style.boxShadow = "0 10px 25px 0 rgba(0 0 0 / 50%)";
    });
    article.addEventListener('mouseout', function() {
      this.style.removeProperty("box-shadow");
    });
  });
});