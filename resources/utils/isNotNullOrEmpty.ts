import { isNullOrEmpty } from "./isNullOrEmpty";

export function isNotNullOrEmpty(value: string | null | undefined) {
    return !isNullOrEmpty(value)
}