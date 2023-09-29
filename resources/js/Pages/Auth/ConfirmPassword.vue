<script setup>
import Element from "@/Components/Element.vue";
import {Head, useForm} from '@inertiajs/vue3';

const form = useForm({
    password: '',
});

const submit = () => {
    form.post(route('password.confirm'), {
        onFinish: () => form.reset(),
    });
};
</script>

<template>
    <Head title="Confirm Password"/>
    <Element type="small"/>
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-10 col-sm-9 col-md-7 col-lg-6 col-xl-5 text-center bg-light border rounded-3 shadow">

                <div class="mt-4 text-black-50">
                    This is a secure area of the application. Please confirm your password before continuing.
                </div>
                <form @submit.prevent="submit">
                    <input v-model="form.password" autocomplete type="password"
                           class="form-control mt-3" placeholder="Password">
                    <p class="text-danger mt-1"><small>{{ form.errors.password }}</small></p>

                    <input type="submit" class="col-7 col-sm-4 btn btn-outline-secondary mt-4 mb-3" value="Confirm">
                </form>

            </div>
        </div>
    </div>
</template>
