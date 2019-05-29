#Frank Senseney
#cs370 lab 2 part 1
#4/22/18

#make directories
mkdir -p meals/{breakfast,lunch/{soup,dessert},dinner/{appetizer,dish}}

#list directories
ls -R

#create text files
echo -e "Eggs\nBacon\nHash browns\nToast\nSteak\nCrepes" >> meals/breakfast/favorites.txt
echo -e "New England Clam Chowder\nButternut squash\nMushroom\nBorsh\nPotato\nMiso" >> meals/lunch/soup/soups.txt
echo -e "Shortbread cookies\nChocolate chip cookies\nOatmeal cookies\nSugar cookies\nOreos" >> meals/lunch/dessert/cookies.txt

#move dish dir into lunch dir
mv meals/dinner/dish meals/lunch

#copy appetizer dir into lunch dir
cp meals/dinner/appetizer meals/lunch

#copy soups.txt into meals dir
cp meals/lunch/soup/soups.txt meals

#list contents of meals and subdirectories
ls -R meals

#list contents of the current directory
ls -a

#get size of meals directory
du -shb meals

#list last 3 lines of soups.txt
tail -3 meals/lunch/soup/soups.txt

#list cookies.txt in alphabetic order
sort meals/lunch/dessert/cookies.txt

#revoke write permissions on soups.txt for everyone but the user
chmod o-w meals/lunch/soup/soup.txt

#find all files and directories in meals that start with s
find meals -name "s*"
