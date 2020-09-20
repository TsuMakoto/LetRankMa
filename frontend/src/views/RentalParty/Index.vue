<template>
  <v-conteiner>
    <v-row class="text-center">
      <v-col v-for="(party, index) in rentalParties.item" :key="index" cols="6">
        <v-card
          :loading="loading"
          class="mx-auto my-12"
          max-width="374"
          >
          <v-img
            height="250"
            src="party.image"
            alt="party.image"
            ></v-img>

          <v-card-title>{{ party.name }}</v-card-title>

          <v-card-text>
            <v-row
              align="center"
              class="mx-0"
              >
              <v-rating
                :value="4.5"
                color="amber"
                dense
                half-increments
                readonly
                size="14"
                ></v-rating>

              <div class="grey--text ml-4">4.5 (413)</div>
            </v-row>

            <div class="my-4 subtitle-1">
              パーティコンセプト
            </div>

            <div>
              概要: {{ party.note }}
            </div>
          </v-card-text>

          <v-divider class="mx-4"></v-divider>

          <v-card-text>
            <v-list subheader>

              <v-list-item
                v-for="item in partyPokemon.item"
                :key="item.name"
                >
                <v-list-item-avatar>
                  <v-img :src="item.dotImg" alt="item.dotImg"></v-img>
                </v-list-item-avatar>

                <v-list-item-content>
                  <v-list-item-title v-text="item.name"></v-list-item-title>
                </v-list-item-content>

              </v-list-item>
            </v-list>
          </v-card-text>

        <v-card-actions>
          <v-btn
            color="deep-purple lighten-2"
            text
            @click="reserve"
            >
            Reserve
          </v-btn>
        </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-conteiner>
</template>

<script lang="ts">
import Vue from 'vue'

export interface Dataset {
  rentalParties: RentalParties;
  partyPokemon: PartyPokemon;
}

export interface RentalParty {
  id: number;
  name: string;
  image: string;
  generation: number;
  season: number;
  rule: string;
  rank: number;
  note: string;
}

export interface RentalParties {
  item: Array<RentalParty>;
}

export interface Pokemon {
  dotImg: string;
  name: string;
}

export interface PartyPokemon {
  item: Array<Pokemon>;
}

export default Vue.extend({
  data: (): Dataset => ({
    rentalParties: {
      item: [{
        id: 1,
        name: 'party01',
        image: '/public/img/party/01.png',
        generation: 6,
        season: 9,
        rule: 'シングルバトル',
        rank: 1,
        note: '基本選出で余裕'
      }]
    },

    partyPokemon: {
      item: [
        {
          dotImg: '/public/img/party/01/01.png',
          name: 'ピカチュウ'
        },
        {
          dotImg: '/public/img/party/02/02.png',
          name: 'ヒトカゲ'
        }
      ]
    }
  })
})

</script>
