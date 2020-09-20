<template>
  <v-container>
    <v-row class="text-center">
      <v-col cols="12">
        <v-img
          :src="require('../assets/logo.svg')"
          class="my-3"
          contain
          height="200"
        />
      </v-col>

      <v-col class="mb-4" cols="12">
        <h1 class="display-2 font-weight-bold mb-3">
          レッツランクマ
        </h1>

        <p class="subheading font-weight-regular">
          育成していなくても対戦はできます
          <br>
          皆、ポケモンやろうぜ！
        </p>
      </v-col>

      <v-col v-for="(page, index) in pageItems" :key="index" cols="6">
        <v-card
          class="mx-auto"
          max-width="400"
          >
          <v-img
            class="white--text align-end"
            height="200px"
            src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
            >
            <v-card-title>{{ page.title }}</v-card-title>
          </v-img>

          <v-card-subtitle class="pb-0">{{ page.subtitle }}</v-card-subtitle>

          <v-card-text class="text--primary">
            <router-link
              v-for="(note, jndex) in page.notes"
              :key="jndex"
              :to="note.url"
              >
              <div> {{ note.text }}</div>
            </router-link>
          </v-card-text>

          <v-card-actions>
            <v-btn
              color="orange"
              text
              :to="page.indexUrl"
              >
              {{ page.indexTitle }}
            </v-btn>

            <v-btn
              color="orange"
              text
              :to="page.newUrl"
              >
              {{ page.newTitle }}
            </v-btn>
          </v-card-actions>
        </v-card>

      </v-col>

    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'

export interface PageItem {
  title: string;
  subtitle: string;
  notes: Array<{ url: string; text: string }>;
  indexUrl: string;
  indexTitle: string;
  newUrl: string;
  newTitle: string;
}

export default Vue.extend({
  data: (): { pageItems: Array<PageItem> } => ({
    pageItems: [
      {
        title: 'レンタルパーティを探す',
        subtitle: 'レンタルパーティを使って、対戦しよう！',
        notes: [
          { url: '#whatIsRental', text: 'レンタルパーティとは？' },
          { url: '#registedRental', text: 'レンタルパーティの登録方法について' }
        ],
        indexUrl: '#indexRentalUrl',
        indexTitle: '借りる',
        newUrl: '#newRentalUrl',
        newTitle: '公開する'
      }
    ]
  })
})
</script>
