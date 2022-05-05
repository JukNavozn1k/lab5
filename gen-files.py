import random
# elCount - первая строка - количество элементов,radius-расстояние от нуля
def create_file(elCount,radius):
    with open('input.txt','w') as f:
        s = str(elCount) + '\n'
        f.write(s)
        for i in range(elCount):
            s = str(str(random.randint(-abs(radius), abs(radius)))) + ' '
            f.write(s)
create_file(1000000,1000000000)