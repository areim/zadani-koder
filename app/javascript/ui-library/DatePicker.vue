<script>
import { DatePicker } from 'element-ui';

export default {
  extends: DatePicker,
  props: {
    pickerOptions: {
      type: Object,
      default() {
        return {
          firstDayOfWeek: 1,
        };
      },
    },
  },
};
</script>

<style lang="scss" scoped>
  ::v-deep {
    &.el-date-editor {
      &.el-input--prefix {
        .el-input__inner {
          padding-right: rem(48px);
          padding-left: rem(8px);
          border-color: $--color-light-blue-new;

          &::placeholder {
            color: $--color-gray-1;
          }
        }

        .el-input__prefix {
          left: auto;
          right: 0;
          border-right: 0;
          border-left: $--input-border;
          color: $--color-primary;
          border-radius: 0 4px 4px 0;
        }
      }

      &.el-input--suffix {
        .el-input__suffix {
          right: rem(40px);
          border-radius: 0 4px 4px 0;
        }
      }
    }
  }
</style>
