class Deploy < Thor::Group
  desc "Deploy to heroku and push to github"
  
  def one
    puts '# Running jekyll'
    `jekyll`
  end
  
  def two                           
    puts '# Pushing to github'
    `git push`                 
  end                      
  
  def three
    puts '# Deploying to Heroku'
    `git push heroku`
  end
end