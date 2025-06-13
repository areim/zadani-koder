<template>
  <div class="form-card">
    <div class="form-card__header">
      <span class="form-card__icon">
        <!-- You can replace this with an SVG or font icon as needed -->
        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <circle cx="12" cy="12" r="12" fill="#097FB5"/>
          <text x="12" y="17" text-anchor="middle" fill="white" font-size="16" font-family="Arial" dy="-2">i</text>
        </svg>
      </span>
      <span class="form-card__title">{{ $t('form.formTitle') }}</span>
    </div>
    <div class="form-card__body">
      <Form :model="resource" ref="form">
        <div class="form-row">
          <div class="form-col form-col--left">
            <FormGroup
              prop="invoiceKind"
              :help="$t('form.invoiceForm.fields.invoiceKind.inputHelp')"
            >
              <Select
                v-model="resource.invoiceKind"
                :placeholder="$t('form.invoiceForm.fields.invoiceKind.label')"
                name="invoiceKind"
              >
                <Option
                  v-for="option in invoiceKinds"
                  :key="option.value"
                  :label="option.name"
                  :value="option.value"
                />
              </Select>
            </FormGroup>
            <FormGroup prop="number">
              <FloatingLabelInput
                name="number"
                type="text"
                v-model="resource.number"
                :placeholder="$t('form.invoiceForm.fields.number.label')"
              />
            </FormGroup>
            <div class="form-row--grouped">
              <FormGroup prop="vs">
                <FloatingLabelInput
                  name="vs"
                  type="text"
                  v-model="resource.vs"
                  :placeholder="$t('form.invoiceForm.fields.vs.label')"
                />
              </FormGroup>
              <FormGroup prop="ks">
                <FloatingLabelInput
                  name="ks"
                  type="text"
                  v-model="resource.ks"
                  :placeholder="$t('form.invoiceForm.fields.ks.label')"
                />
              </FormGroup>
            </div>
          </div>
          <div class="form-col form-col--right">
            <FormGroup prop="issedOn">
              <DatePicker
                v-model="resource.issedOn"
                value-format="timestamp"
                :clearable="false"
                :placeholder="$t('form.invoiceForm.fields.issedOn.label')"
              />
            </FormGroup>
            <FormGroup prop="maturityKind">
              <Select
                v-model="resource.maturityKind"
                :placeholder="$t('form.invoiceForm.fields.maturity.label')"
                name="maturityKind"
              >
                <Option
                  v-for="option in maturityKinds"
                  :key="option.value"
                  :label="option.name"
                  :value="option.value"
                />
              </Select>
            </FormGroup>
          </div>
        </div>
      </Form>
    </div>
  </div>
</template>

<script>
export default {
  name: 'BasicForm',
  data: () => ({
    resource: {
      number: '',
      vs: '',
      ks: '',
      issedOn: '',
      invoiceKind: 'vat_invoice',
      maturityKind: ''
    },
    invoiceKinds: [
      { value: 'vat_invoice', name: 'Faktura s DPH' },
      { value: 'invoice', name: 'Faktura bez DPH' },
      { value: 'proforma', name: 'Proforma' },
    ],
    maturityKinds: [
      { value: '7', name: '7 dnů' },
      { value: '14', name: '14 dnů' },
      { value: '21', name: '21 dnů' },
    ]
  })
}
</script>

<style scoped>
.form-card {
  border: 1px solid #cbe0ed;
  border-radius: 12px;
  background: #fff;
  padding: 2rem;
  margin: 2rem 0;
  box-shadow: 0 2px 8px rgba(9, 127, 181, 0.04);
}
.form-card__header {
  display: flex;
  align-items: center;
  margin-bottom: 2rem;
}
.form-card__icon {
  margin-right: 1rem;
  display: flex;
  align-items: center;
}
.form-card__title {
  font-size: 1.5rem;
  font-weight: 700;
  color: #097FB5;
}
.form-card__body {
  width: 100%;
}
.form-row {
  display: flex;
  gap: 2rem;
}
.form-col {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}
.form-row--grouped {
  display: flex;
  gap: 1rem;
}
</style>
