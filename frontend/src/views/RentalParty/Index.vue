<template>
  <v-container>
    <v-row class="text-center">
      <v-col v-for="(party, index) in rentalParties.item" :key="index" cols="6">
        <v-card
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
            <v-list>

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
            >
            Reserve
          </v-btn>
        </v-card-actions>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script lang="ts">
import Vue from 'vue'
import axios from 'axios'

export interface Dataset {
  rentalParties: RentalParties;
  partyPokemon: PartyPokemon;
}

export interface RentalParty {
  id: { value: number };
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
  name: 'RentalParties',

  data: (): Dataset => ({
    rentalParties: {
      item: []
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
  }),

  mounted () {
    axios
      .get('/api/rentalparties')
      .then(resp => {
        this.rentalParties.item = resp.data
      })
  }
})

</script>
