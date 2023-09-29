<script setup>
import { Head, Link, useForm } from '@inertiajs/vue3';
import Element from "@/Components/Element.vue";

defineProps({
    languages: Array,
});

const form = useForm({
    name: '',
    email: '',
    password: '',
    password_confirmation: '',
    language_id: '',
});

const submit = () => {
    form.post(route('register'), {
        onFinish: () => form.reset('password', 'password_confirmation'),
    });
};
</script>

<template>
    <Head title="Register"/>
    <Element type="small"></Element>
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-9 col-sm-7 col-md-6 col-lg-5 col-xl-3 text-center bg-light border rounded-3 shadow">
                <form @submit.prevent="submit">

                    <input v-model="form.name" type="text" class="form-control mt-5" placeholder="Name">
                    <p class="text-danger text-small mt-1"><small>{{ form.errors.name }}</small></p>

                    <input v-model="form.email" autocomplete="username" type="email" class="form-control mt-3"
                           placeholder="Email">
                    <p class="text-danger text-small mt-1"><small>{{ form.errors.email }}</small></p>

                    <input v-model="form.password" autocomplete="current-password" type="password"
                           class="form-control mt-3" placeholder="Password">
                    <p class="text-danger text-small mt-1"><small>{{ form.errors.password }}</small></p>

                    <input v-model="form.password_confirmation" autocomplete="new-password" type="password"
                           class="form-control mt-3" placeholder="Confirm Password">
                    <p class="text-danger text-small mt-1"><small>{{ form.errors.password_confirmation }}</small></p>

                    <select v-model="form.language_id" class="form-select mt-3">
                        <option value="" disabled>Select your language</option>
                        <option v-for="language in languages" :value="language.id">{{ language.title }}</option>
                    </select>
                    <p class="text-danger text-small mt-1"><small>{{ form.errors.language_id }}</small></p>

                    <input type="submit" class="col-7 col-sm-4 btn btn-outline-secondary mt-4" value="Register">

                </form>
                <div class="mt-3 mb-3">
                    <Link :href="route('login')" class="btn-link">Login</Link>
                </div>
            </div>
        </div>
    </div>
</template>
