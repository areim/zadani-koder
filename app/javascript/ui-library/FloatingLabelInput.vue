<template>
  <div class="floating-label-input" :class="{ 'is-focused': isFocused, 'has-value': hasValue }">
    <input
      :type="type"
      :name="name"
      :value="value"
      class="floating-label-input__field"
      @input="handleInput"
      @focus="handleFocus"
      @blur="handleBlur"
      :autocomplete="autocomplete"
    />
    <label class="floating-label-input__label">{{ placeholder }}</label>
  </div>
</template>

<script>
export default {
  name: 'FloatingLabelInput',
  props: {
    value: {
      type: [String, Number],
      default: ''
    },
    placeholder: {
      type: String,
      default: ''
    },
    type: {
      type: String,
      default: 'text'
    },
    name: {
      type: String,
      default: ''
    },
    autocomplete: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      isFocused: false
    }
  },
  computed: {
    hasValue() {
      return this.value && this.value.toString().length > 0
    }
  },
  methods: {
    handleInput(event) {
      this.$emit('input', event.target.value)
    },
    handleFocus() {
      this.isFocused = true
    },
    handleBlur() {
      this.isFocused = false
    }
  }
}
</script>

<style lang="scss" scoped>
.floating-label-input {
  position: relative;
  margin-bottom: 1rem;
}

.floating-label-input__field {
  width: 100%;
  height: 3rem;
  padding: 1rem 0.75rem 0.5rem 0.75rem;
  border: 1px solid $--color-light-blue-new;
  border-radius: 0.375rem;
  font-size: 1rem;
  background-color: white;
  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
  
  &:focus {
    outline: none;
    border-color: $--color-primary;
    box-shadow: 0 0 0 3px rgba(9, 127, 181, 0.1);
  }
}

.floating-label-input__label {
  position: absolute;
  left: 0.75rem;
  top: 50%;
  transform: translateY(-50%);
  font-size: 1rem;
  color: $--color-gray-1;
  pointer-events: none;
  transition: all 0.2s ease-in-out;
  background-color: white;
  padding: 0 0.25rem;
}

.floating-label-input.is-focused .floating-label-input__label,
.floating-label-input.has-value .floating-label-input__label {
  top: 0;
  transform: translateY(-50%);
  font-size: 0.75rem;
  color: #097FB5;
  font-weight: 500;
}

.floating-label-input.is-focused .floating-label-input__field {
  padding-top: 1.25rem;
  padding-bottom: 0.25rem;
}

.floating-label-input.has-value .floating-label-input__field {
  padding-top: 1.25rem;
  padding-bottom: 0.25rem;
}
</style> 