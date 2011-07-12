class Blog < Thor
  
  desc "deply", "Deploy to heroku and push to github"
  def deploy         
    puts '# Generating _site with jekyll'
    `jekyll`                           
    puts '# Pushing to github'
    `git push`             
    puts '# Deploying to Heroku'
    `git push heroku`
  end         
end