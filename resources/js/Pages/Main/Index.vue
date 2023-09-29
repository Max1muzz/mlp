<template>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-4 text-center mt-2">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <button type="button" class="btn btn-secondary btn-sm" @click="type = 'think'">Think</button>
                    <button type="button" class="btn btn-secondary btn-sm" @click="type = 'speak'">Speak</button>
                    <button type="button" class="btn btn-secondary btn-sm" @click="type = 'hear'">Hear</button>
                </div>
            </div>
            <div class="col-4 text-center mt-2">
                <button type="button" class="btn btn-success">START</button>
            </div>
            <div class="col-4 text-end mt-2">
                <Link :href="route('logout')" method="post" as="button" class="btn btn-outline-secondary btn-sm">Logout</Link>
            </div>

        </div>
    </div>
    <div v-if="type == 'think'">
        <Element :type=type></Element>
    </div>
    <div v-if="type == 'speak'">
        <Element :type=type></Element>
    </div>
    <div v-if="type == 'hear'">
        <Element :type=type></Element>
    </div>
</template>

<script>
import {ref} from 'vue';
import {Head, Link} from '@inertiajs/vue3';
import Element from '@/Components/Element.vue';
export default {
    components: {
        Element, Link, Head
    },
    setup() {
        const type = ref('think');
        //console.log(type.value);
        return {
            type
        };
    },
}
</script>
<style>

</style>
