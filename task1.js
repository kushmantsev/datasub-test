/*Родительский класс*/

class AClass { 
    Numbers = [];
    constructor(n) { /*Конструктор*/
        this.n = n;
        if(!n) {
            throw new Error('No arg input!');
        }
        this.#fill();
    }

    #fill() { /*Приватный метод заполнения случайными числами*/
        for (let i=0; i < this.n; i++) {
            this.Numbers.push(Math.floor(Math.random()*(10-1+1)+1)); //случайные числа от 1 до 10
        }
    }

    factorial() { /*Вычисление факториалов*/
        const Factorials = this.Numbers.map(
            function getFactorial (number) {
                return (number == 0 ? 1 : number * getFactorial(number-1));
            }
        )
        console.log(Factorials);
    }

    sort() {
    }

}

/*Дочерний класс 1*/
class Class1 extends AClass {
    sort(){
        this.Numbers = this.Numbers.sort(function(x, y){
            return x - y;
        });
        console.log(this.Numbers);
        this.factorial();
    }
}

/*Дочерний класс 2*/
class Class2 extends AClass {
    sort(){
        this.Numbers = this.Numbers.sort(function(x, y){
            return y - x;
        });
        console.log(this.Numbers);
        this.factorial();
    }
}

const test = new Class1(5);
const test2 = new Class2(9);
test.sort();
test2.sort();

