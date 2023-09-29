<script setup>
import Element from "@/Components/Element.vue";
import {Head, Link, useForm} from '@inertiajs/vue3';

defineProps({
    status: String,
});

const form = useForm({
    email: '',
});

const submit = () => {
    form.post(route('password.email'));
};
</script>

<template>
    <Head title="Forgot Password"/>
    <Element type="small"></Element>
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-10 col-sm-9 col-md-7 col-lg-6 col-xl-5 text-center bg-light border rounded-3 shadow">
                <div v-if="!status" class="mt-4 text-black-50">
                    Forgot your password? No problem. Just let us know your email address and we will email you a password reset
                    link that will allow you to choose a new one.
                </div>
                <div v-if="status" class="mt-4 text-success">
                    {{ status }}
                </div>
                <form @submit.prevent="submit">
                    <input v-model="form.email" autocomplete type="email" class="form-control mt-3"
                           placeholder="Email">
                    <p class="text-danger text-small mt-1"><small>{{ form.errors.email }}</small></p>
                    <input type="submit" class="col-7 btn btn-outline-secondary mt-4" value="Email Link">
                </form>
                <div class="mt-3 mb-3">
                    <Link :href="route('login')" class="btn-link">Login</Link>
                </div>
            </div>
        </div>
    </div>
</template>
