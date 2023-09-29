<script setup>
import Element from "@/Components/Element.vue";
import {Head, useForm} from '@inertiajs/vue3';

const props = defineProps({
    email: {
        type: String,
        required: true,
    },
    token: {
        type: String,
        required: true,
    },
});

const form = useForm({
    token: props.token,
    email: props.email,
    password: '',
    password_confirmation: '',
});

const submit = () => {
    form.post(route('password.store'), {
        onFinish: () => form.reset('password', 'password_confirmation'),
    });
};
</script>

<template>
    <Head title="Reset Password"/>
    <Element type="small"/>
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-10 col-sm-9 col-md-7 col-lg-6 col-xl-5 text-center bg-light border rounded-3 shadow">

                <form @submit.prevent="submit">
                    <input v-model="form.email" autocomplete type="email" class="form-control mt-5"
                           placeholder="Email">
                    <p class="text-danger text-small mt-1"><small>{{ form.errors.email }}</small></p>
                    <input v-model="form.password" autocomplete type="password"
                           class="form-control mt-3" placeholder="New Password">
                    <p class="text-danger mt-1"><small>{{ form.errors.password }}</small></p>
                    <input v-model="form.password_confirmation" autocomplete="new-password" type="password"
                           class="form-control mt-3" placeholder="Confirm Password">
                    <p class="text-danger text-small mt-1"><small>{{ form.errors.password_confirmation }}</small></p>
                    <input type="submit" class="col-7 col-sm-4 btn btn-outline-secondary mt-4 mb-3" value="Reset">
                </form>

            </div>
        </div>
    </div>

</template>
