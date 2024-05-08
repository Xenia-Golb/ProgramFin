'use strict';

class Animal {

    constructor(name, breed) {
        this.name = name;
        this.breed = breed;
        this.commands = [];
    }
    eat() {
        console.log(`${this.name} is eating`);
    }
    sleep() {
        console.log(`${this.name} is sleeping`);
    }


}
class Dog extends Animal {
    constructor(name, breed) {
        super(name, breed);
        this.commands = ["Сидеть", "Лежать"];
    }
}

class Cat extends Animal {
    constructor(name, breed) {
        super(name, breed);
        this.commands = ["Мурлыкать", "Точить коготки"];
    }
}

const animals = JSON.parse(localStorage.getItem('animals')) || [];

const addAnimal = function () {
    const name = prompt("Введите имя животного: ");
    const breed = prompt("Введите породу животного: ");
    const type = prompt("Введите тип животного (собака/кошка): ");
    if (type === "собака") {
        animals.push(animals[name] = new Dog(name, breed));

    } else if (type === "кошка") {
        animals.push(new Cat(name, breed));

    } else {
        console.log("Неверный тип животного.");
        return;
    }
    localStorage.setItem('animals', JSON.stringify(animals));
}
const showAnimals = () => {
    JSON.stringify(animals.forEach(animal => {
        console.log(`${animal.name} - это ${animal.breed}.`);
        const animalBlock = document.createElement('div');
        animalBlock.classList.add('animal-block');
        animalGlob.appendChild(animalBlock);
        const imgElDog = document.createElement('img');
        imgElDog.src = "https://www.eleveurs-online.com/data/race/323.300.jpg"
        animalBlock.appendChild(imgElDog)
        const txtEl = document.createElement('p');
        animalBlock.appendChild(txtEl);
        txtEl.innerHTML = ` ${animal.name} - это ${animal.breed}.`
    }));

}
function showAnimalCommands() {
    const name = prompt("Введите имя животного: ");
    for (const animal of animals) {
        if (animal.name.toLocaleLowerCase() === name.toLocaleLowerCase()) {
            const command = document.createElement('div');
            animalGlob.appendChild(command);
            command.classList.add('command');
            const imgElCat = document.createElement('img');
            imgElCat.src = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrnK5NDFAEPJVfN4It6LfIdfiAGVdwTJ2RDef7n-yLsw&s';
            animalGlob.appendChild(imgElCat)
            command.innerHTML = `Животное ${animal.name} - знает команды:${animal.commands}`
        } else {
            console.log('Животное не найдено')
        }
    }
}

function teachAnimalNewCommand() {
    const name = prompt("Введите имя животного: ");
    for (const animal of animals) {
        if (animal.name.toLocaleLowerCase() === name.toLocaleLowerCase()) {
            const command = prompt("Введите команду, которую хотите обучить: ");
            animal.commands.push(command);
            console.log(`Животное ${name} успешно обучено команде ${command}.`)
            alert(`Животное ${name} успешно обучено команде ${command}.`)
            localStorage.setItem('animals', JSON.stringify(animals));
        } else {
            console.log('Животное не найдено');
        }
    }
}
function removeAnimal() {
    const name = prompt("Введите имя животного: ");
    for (const animal of animals) {
        if (animal.name.toLocaleLowerCase() === name.toLocaleLowerCase()) {
            animals.splice(animals.indexOf(animal), 1);
            localStorage.setItem('animals', JSON.stringify(animals));
            console.log('Животное удалено');
            alert('Животное удалено')
        } else {
            console.log('Животное не найдено');
        }

    }
}


const buttonMenu = document.querySelector('.button-menu-big');
const animalGlob = document.querySelector('.animals');
const addBtn = document.querySelector('.add');
const showBtn = document.querySelector('.show');
const teachBtn = document.querySelector('.teach-command');
const commandBtn = document.querySelector('.show-commands')
const removeBtn = document.querySelector('.remove');


buttonMenu.addEventListener('click', () => {
    const btnEls = document.querySelectorAll('.button-menu');
    btnEls.forEach(btnEl => {
        btnEl.style.display = 'block';
    })
})

addBtn.addEventListener('click', () => {
    addAnimal();

});

showBtn.addEventListener('click', () => {
    showAnimals();

});
teachBtn.addEventListener('click', () => {
    teachAnimalNewCommand();
});
commandBtn.addEventListener('click', () => {
    showAnimalCommands();
})
removeBtn.addEventListener('click', () => {
    removeAnimal();
})
