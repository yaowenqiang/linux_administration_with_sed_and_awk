#!/bin/bash
for f in ~/Code/linux_project/sed-and-awk/scripts/*.sh;do
  firstline=$(sed -n '1p' $f)
  if [[ $firstline != "#!"* ]]; then
      echo "Adding shebang to $f"
      sed -i '1i #!/bin/bash' $f
  fi
done
