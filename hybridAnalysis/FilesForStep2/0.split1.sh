mkdir job1
cp 1_luna-generate_particles.py job1
cp 2_luna-skimHitInfo.py job1
cp 3-ww-createHitFiles.py job1
cp generate_particles.cfg job1
cp hybridRun7.sh job1 #WARNING you will have to change path in script
cd job1
mkdir data
mkdir JobsOutput
cd ../

mkdir job2
cp 1_luna-generate_particles.py job2
cp 2_luna-skimHitInfo.py job2
cp 3-ww-createHitFiles.py job2
cp generate_particles.cfg job2
cp hybridRun7.sh job2 #WARNING you will have to change path in script
cd job2
mkdir data
mkdir JobsOutput
cd ../

mkdir job3
cp 1_luna-generate_particles.py job3
cp 2_luna-skimHitInfo.py job3
cp 3-ww-createHitFiles.py job3
cp generate_particles.cfg job3
cp hybridRun7.sh job3 #WARNING you will have to change path in script
cd job3
mkdir data
mkdir JobsOutput
cd ../

cd data
split -d -l 500 vertexSkim.txt vertexSkim_

mv vertexSkim_00 ../job1/data/vertexSkim.txt
mv vertexSkim_01 ../job2/data/vertexSkim.txt
mv vertexSkim_02 ../job3/data/vertexSkim.txt
