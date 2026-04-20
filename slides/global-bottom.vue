<template>
  <footer
    v-if="$nav.currentLayout !== 'cover' && $nav.currentLayout !== 'end'"
    class="absolute bottom-0 left-0 right-0 px-6 py-2 flex justify-between text-xs opacity-40"
  >
    <span>EvolvePro Workshop</span>
    <span>{{ $nav.currentPage }} / {{ $nav.total }}</span>
  </footer>
</template>
