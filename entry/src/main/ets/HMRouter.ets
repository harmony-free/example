export function HMRouter(param: HMRouterParam) {
  return Object;
}

export interface HMRouterParam {
  pageUrl: string;
  isRegex?: boolean;
  regexPriority?: number;
  dialog?: boolean;
  singleton?: boolean;
  interceptors?: string[];
  animator?: string;
  lifecycle?: string;
}