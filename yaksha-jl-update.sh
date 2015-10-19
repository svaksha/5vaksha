#/usr/bin/env bash
################################################################################
# File       : yaksha-jl-update.sh from <http://svaksha.github.io/yaksha>
# Description: Installation script to install AND update the Julia source build
# AUTHOR     : SVAKSHA <http://svaksha.github.io/yaksha> + Credits
# COPYRIGHT© : 2005-Now SVAKSHA <http://svaksha.com/pages/Bio> AllRightsReserved
# DATES      : Created:2015feb15 - Updated:2015oct19
# LICENSE    : GNU AGPLv3 License <http://www.gnu.org/licenses/agpl.html>
################################################################################
# CREDITS:
# 1. @jiahao, https://gist.github.com/jiahao/3f9826b077372220b6f0
# 2. @svaksha
#
# An experimental script to automatically update julia
# USAGE:
# install julia unstable: ./yaksha-jl-update.sh jl_gitdev
# install julia nightly: ./yaksha-jl-update.sh jl_ppanightlies
################################################################################



#An experimental script to automatically update julia
#
#/usr/bin/env sh
JULIADIR=$HOME/julia

cd $JULIADIR

#Check all dynamic library dependencies to detect potentially missing
#dependencies
for LIB in `find deps -name "*.dylib"`; do
  #Find dependencies that have absolute paths
  LIBDEPS=$(otool -L $LIB | grep -v : | grep -v @ | grep \/ | cut -f1 -d\()

  #If dependency is missing, assume that the external library was upgraded and
  #version number got bumped.
  for filename in $LIBDEPS; do
    if test ! -e $filename; then
      echo WARNING: $LIB: Could not find dynamic library dependency $filename
      echo Wiping all dependencies to trigger rebuild
      make -C deps cleanall
      break 2
    fi
  done
done

git pull

#Rebuild at all costs
make
if test $? -ne 0 ; then
  make clean
  make cleanall
  make
fi
if test $? -ne 0; then #nuclear option
  git clean -xfd
  make
fi


./julia -e 'versioninfo()'  # which JL version?
./julia -e 'Pkg.status()'   # provide pkg list
./julia -e 'Pkg.update()'  #Update Julia packages




#function yaksha_require()
# generate a list of all the packages I've installed and pipe to "yaksha"
    for require `find pkg -name "*.julia/v0.*/REQUIRE"`; do
        collect(keys(Pkg.installed()))
        readandwrite(`~/.julia/v0.5/REQUIRE` .> "~/yaksha/REQUIRE")
    end
#end


