
bgit = function( project="bio.base", action="status", ... ) {
  #\\ interact with bio.* tools to interpoate with git
  # NOTE:: default is to return to branch "develop"

  wd.start = getwd()

  reploc = bio.base::project.codedirectory( project )
  setwd( reploc )

  if (action=="status" ) {
    system2( "git",  "status" )
  }

  if (action=="commit" ) {
    system2( "git",  paste("commit -am '", c(...), "'") )
  }

  if (action=="checkout" ) {
    system2( "git",  paste("checkout", c(...)) )
  }

  if (action=="branch" ) {
    system2( "git",  paste("branch", c(...)) )
  }

  if (action=="merge" ) {
    system2( "git",  paste("merge", c(...)) )
  }

  if (action=="merge.develop.to.master" ) {
    system2( "git", "checkout master" )
    system2( "git", "merge develop" )
    system2( "git", "checkout develop" )
  }

  if (action=="merge.master.to.develop" ) {
    system2( "git", "checkout develop" )
    system2( "git", "merge master" )
  }

  if (action=="pull" ) {
    system2( "git", "checkout master" )
    system2( "git", paste( "pull", c(...) ) )
    system2( "git", "checkout develop" )
   }

  if (action=="push" ) {
    system2( "git", "checkout master" )
    system2( "git", paste( "push", c(...) ) )
    system2( "git", "checkout develop" )
   }

  if (action=="update" ) {
    system2( "git",  paste("commit -am '", c(...), "'" ) )
    system2( "git", "checkout master" )
    system2( "git", "merge develop" )
    system2( "git", "checkout develop" )
  }

  if (action=="update.and.push.to.github" ) {
    system2( "git",  paste("commit -am '", c(...)), "'" )
    system2( "git", "checkout master" )
    system2( "git", "merge develop" )
    system2( "git", "push" )
    system2( "git", "checkout develop" )
  }

  if (action=="direct" ) {
    system2( "git", c(...) )
  }

  system2( "git", "branch")
  system2( "git", "status")
  setwd( wd.start )
  paste0( "Current working directory is: ", wd.start )
  invisible()
}


