<script setup>
import {computed} from 'vue';
import Element from "@/Components/Element.vue";
import {Head, Link, useForm} from '@inertiajs/vue3';

const props = defineProps({
    status: {
        type: String,
    },
});

const form = useForm({});

const submit = () => {
    form.post(route('verification.send'));
};

const verificationLinkSent = computed(() => props.status === 'verification-link-sent');
</script>

<template>
    <Head title="Email Verification"/>
    <Element type="small"/>
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-11 col-sm-10 col-md-9 col-lg-8 col-xl-7 text-center bg-light border rounded-3 shadow">
                <div v-if="!verificationLinkSent"  class="text-center mt-3">
                    Thanks for signing up! Before getting started, could you verify your email address by clicking on the
                    link we just emailed to you? If you didn't receive the email, we will gladly send you another.
                </div>
                <div v-if="verificationLinkSent" class="text-center mt-3">
                    A new verification link has been sent to the email address you provided during registration.
                </div>
                <form @submit.prevent="submit">
                    <input type="submit" class="col btn btn-outline-primary mt-4"
                           value="Resend Verification Email">
                </form>
                <div class="mt-3 mb-3">
                    <Link :href="route('logout')" method="post" class="btn btn-outline-danger">
                        Log Out
                    </Link>
                </div>
            </div>
        </div>
    </div>
</template>
