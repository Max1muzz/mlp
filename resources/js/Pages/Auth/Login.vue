<script setup>
import {Head, Link, useForm} from '@inertiajs/vue3';
import Element from '@/Components/Element.vue';

const form = useForm({
    email: '',
    password: '',
    remember: true,
});
const submit = () => {
    form.post(route('login'), {
        onFinish: () => form.reset('password'),
    });
};
</script>

<template>
    <Head title="Login"/>
    <Element type="small"></Element>
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-9 col-sm-7 col-md-6 col-lg-5 col-xl-3 text-center bg-light border rounded-3 shadow">
                <form @submit.prevent="submit">
                    <input v-model="form.email" autocomplete type="email" class="form-control mt-5"
                           placeholder="Email">
                    <p class="text-danger text-small mt-1"><small>{{ form.errors.email }}</small></p>
                    <input v-model="form.password" autocomplete type="password"
                           class="form-control mt-3" placeholder="Password">
                    <p class="text-danger mt-1"><small>{{ form.errors.password }}</small></p>
                    <input type="submit" class="col-7 col-sm-4 btn btn-outline-secondary mt-4" value="Login">
                </form>
                <div class="mt-3">
                    <Link :href="route('register')" class="btn-link">Register</Link>
                </div>
                <div class="mt-3 mb-3">
                    <Link :href="route('password.request')" class="btn-link">Forgot password?</Link>
                </div>
            </div>
        </div>
    </div>
</template>
