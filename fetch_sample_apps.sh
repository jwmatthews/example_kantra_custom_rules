pushd .
mkdir -p sample_repos
cd sample_repos || exit

git clone https://github.com/konveyor-ecosystem/bmt.git
git clone https://github.com/konveyor-ecosystem/cmt.git 
git clone https://github.com/konveyor-ecosystem/greeter.git
git clone https://github.com/konveyor-ecosystem/tasks-qute.git

popd || exit
