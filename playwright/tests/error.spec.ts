// @ts-check
import { test, expect } from '@playwright/test';

test.describe.configure({ mode: 'parallel' });

test('Open Google', async ({page, context}) => {
    await page.goto('/');
    await page.pause();
    await expect(page).toHaveURL('/error');
});