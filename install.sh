#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Invalid argument count: expected 1"
  exit 1
fi

project_dir="project"
log_dir="${project_dir}/log"
scripts_dir="${project_dir}/scripts"
lib_dir="${project_dir}/libs"

application_name="$1"

mkdir -p "$project_dir"
mkdir -p "$lib_dir"
mkdir -p "$scripts_dir"
mkdir -p "$lib_dir"

if [ -e "$application_name" ]; then
  cp "$application_name" "$project_dir"
  echo "Executable file ${application_name} was copyed into ${project_dir}"
  else
    echo "File ${application_name} not exist"
    exit 1
fi

for conffile in conf/*.ini
do
  cp "$conffile" "$project_dir"
  echo "Conf file $(basename ${conffile}) was copyed into ${project_dir}"
done

for libfile in libs/*.so*
do
  cp "libfile" "$lib_dir"
  echo "Library $(basename ${libfile}) was copyed into ${lib_dir}"

done

echo -e "#!bin/bash
cd ..
while true
do
./hello
sleep 1
done

exit 0

" > "${scripts_dir}/autorun.sh"



exit 0