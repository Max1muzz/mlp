<template>
    <div class="ani">
        <div :class="size">
            <div
                v-if="type == 'small'"
                v-for="number in numbers"
                class="el"
                :style="{
                    backgroundColor: `hsl(${(360 / numbers.length) * number}, 40%, 60%)`,
                    transform: `rotate(${(360 / numbers.length) * number}deg) translateY(-30%)`,
                    scale: [1, 0.3],
                    duration: 1,
                }"
            >
            </div>
            <div
                v-if="type != 'small'"
                v-for="number in numbers"
                class="el"
                :style="{
                    backgroundColor: `hsl(${(360 / numbers.length) * number}, 40%, 60%)`,
                    transform: `rotate(${(360 / numbers.length) * number}deg) translateY(-50%)`,
                    scale: [1, 0.8],
                    duration: 1,
                }"
            >
            </div>
        </div>
    </div>
</template>

<script>
import { ref, onMounted, onBeforeUnmount, computed } from 'vue'
import anime from 'animejs'

export default {
    name: 'Element',
    props: {
        type: String,
    },
    setup(props) {
        const numbers = ref(Array.from({ length: 90 }, (_, index) => index))

        const size = computed(() => {
            if (props.type == 'small') {
                return 'wrapper-small'

            } else {
                return 'wrapper'
            }
        })
        onMounted(() => {
            if (props.type == 'think') {
                createEl(numbers.value, true, 2500, 0.1, 1.3, 10, 8)

            } else if (props.type == 'small') {
                createEl(numbers.value, true, 2500, 0.1, 1.3, 10, 8, -30)

            } else {
                numbers.value = shuffleArray(numbers.value)

                if (props.type == 'speak') {
                    createEl(numbers.value, true, 1000, 0.3, 1.8, 10)

                } else if (props.type == 'hear') {
                    createEl(numbers.value, true, 2000, 0.3, 1.4, 30)
                }
            }
        })
        onBeforeUnmount(() => {
            numbers.value.forEach((i, j) => {
                anime.remove(`.el:nth-child(${j + 1})`)
            })
        })

        return {numbers, size}
    },
}

// Функция для перемешивания массива
function shuffleArray(array) {
    for (let i = array.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1))
        ;[array[i], array[j]] = [array[j], array[i]]
    }
    return array;
}

//Функция для создания элементов
function createEl(numbers, restart, duration, dur, scale, y, x = 0, translateY = -50) {
    const delay = duration / numbers.length

    let tl = anime.timeline({
        duration: delay,
        complete: function () {
            restart ? tl.restart() : ''
        },
    })

    numbers.forEach((i, j) => {
        const rotate = (360 / numbers.length) * i
        const hue = Math.round(360 / numbers.length * i)

        tl.add({
            begin: function () {
                anime({
                    targets: `.el:nth-child(${j + 1})`,
                    backgroundColor: [`hsl(${hue}, 40%, 60%)`, `hsl(${hue}, 60%, 80%)`],
                    rotate: [`${rotate}deg`, `${rotate - x}deg`],
                    translateY: [`${translateY}%`, `${translateY + y}%`],
                    scale: [1, scale],
                    easing: 'easeInOutSine',
                    direction: 'alternate',
                    duration: duration * dur,
                })
            },
        })
    })
}
</script>

<style scoped>
.ani {
    /* Центрирование содержимого на странице */
    display: flex;
    justify-content: center;
    align-items: center;
}

.wrapper {
    /* Создание контейнера для элементов */
    position: relative;
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    width: 1px;
    height: 50vh;
}

.wrapper-small {
    /* Создание контейнера для элементов */
    position: relative;
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    width: 1px;
    height: 25vh;
}


.el {
    /* Стилизация вращающихся элементов */
    position: absolute;
    opacity: 1;
    width: 2px;
    height: 14vh;
    margin-top: -12vh;
    transform-origin: 50% 100%;
}
</style>
