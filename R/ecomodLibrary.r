ecomodLibrary = function( ... ) {
  #\\ wrapper to load ecomod libraies from local installation
  #\\ or download/install and then load if missing
    gref = ecomodLibraryList()
    notinEcomod = setdiff( c(...), gref$libname )
    if (length( notinEcomod) > 0 ) {
      print( "The following are not part of ecomod ... " )
      print( notinEcomod )
    }

    pkgs = rownames(installed.packages())
    found = intersect( pkgs, c(...) )
    if (length(found) > 0 ) {
      for ( l in found ) require( l, character.only=T )
    }
    notfound = setdiff( c( ... ), pkgs )
    if (length(notfound) > 0) {
      print( "Missing some ecomod dependencies...")
      n = readline(prompt="Install them? (y/n): ")
      if ( tolower(n) %in% c("y", "yes") ) {
        if ( ! "devtools" %in% pkgs ) install.packages( "devtools", dependencies=TRUE )
        require(devtools)
        for ( nf in notfound ) {
          oo = which( gref$libname == nf )
          if (length(oo)==1) try( install_github( gref$githubLoc[oo] ) )
        }
      }
    }

  return( c(...) )
}


