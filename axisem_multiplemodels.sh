#Bash script to run multiple models with Axisem.


#Specify Meshing directories and file names (models) to be run

cd ~/axisem-9f0be2f/MESHER/

models=(Gradient02_Depth358  Gradient02_Depth383  Gradient02_Depth408
Gradient02_Depth363  Gradient02_Depth388  Gradient02_Depth413
Gradient02_Depth368  Gradient02_Depth393  Gradient02_Depth418
Gradient02_Depth373  Gradient02_Depth398  Gradient02_Depth423
Gradient02_Depth378  Gradient02_Depth403  PREM_real)


#Update MESH template with new file names
#Be sure to edit the MESH Template manually to specify period.

for i in "${models[@]}"
do
  sed "s/external_model/$i/" inparam_mesh_TEMPLATE > inparam_mesh

#Run mesher and move to solver
 ./xmesh > OUTPUT
 ./movemesh.csh $i

  cd ../SOLVER

  sed "s/mesh_name/$i/" inparam_basic_template > inparam_basic

 ./submit.csh $i

  cd $i

#Initialize while loop to track solver status. This is done to ensure
#that the solver is finished before moving on tot he next file.

status=0

while [ $status = 0 ]
do
if [ -e timestamp0100.txt ]
then
  status=1
  killall -9 compiz

fi
done

  cd  ~/axisem-9f0be2f/MESHER/

done
