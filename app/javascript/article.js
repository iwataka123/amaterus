window.addEventListener('turbo:load', function(){
  const articles = document.querySelectorAll(".article");
  articles.forEach(function(article) {
    article.addEventListener('mouseover', function() {
      this.style.boxShadow = "0 0 3px 0 rgba(0, 0, 0, 0.12), 0 2px 3px 0 rgba(0, 0, 0, 0.22)";
    });
    article.addEventListener('mouseout', function() {
      this.style.removeProperty("box-shadow");
    });
  });
});