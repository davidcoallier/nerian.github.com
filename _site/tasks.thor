class Blog < Thor
  
  desc "deploy", "Deploy to heroku and push to github"
  def deploy                           
    puts '# Pushing to github'
    `git push`             
    puts '# Deploying to Heroku'
    `git push heroku`
  end                     
end